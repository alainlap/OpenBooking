
# IMPORTANT: Must drop and re-setup db before running. Relies on equal numbers of clients, providers and users, and on the presumption that all availabilities are 24/7. This is true of the data it generates.

require 'faker'

class Fakeout

  # START Customizing

  # 1. first these are the model names we're going to fake out, note in this example, we don't create tags/taggings specifically
  # but they are defined here so they get wiped on the clean operation
  # e.g. this example fakes out, Users, Questions and Answers, and in doing so fakes some Tags/Taggings
  MODELS = %w(User Client Provider)

  # 2. now define a build method for each model, returning a list of attributes for Model.create! calls
  # check out the very excellent faker gem rdoc for faking out anything from emails, to full addresses; http://faker.rubyforge.org/rdoc
  # NOTE: a build_??? method MUST exist for each model you specify above
  def build_user(username = "#{Faker::Internet.user_name}_#{random_letters}", email = "test#{(@@counter+=1)}@test.com", password = 'test')
    { :username              => username,
      :email                 => email,
      :password              => password,
      :password_confirmation => password }
  end

  def build_client

    { :name             => Faker::Name.name,
      :address          => Faker::Address.street_address + Faker::Address.street_name,
      :postal_code      => Faker::Address.zip_code,
      :city             => Faker::Address.city,
      :province         => Faker::Address.state_abbr,
      :user_id          => (@@counter += 1),
      :phone_number     => Faker::PhoneNumber.phone_number }
  end

  def build_provider

    { :name             => Faker::Company.name,
      :address          => Faker::Address.street_address + Faker::Address.street_name,
      :postal_code      => Faker::Address.zip_code,
      :city             => Faker::Address.city,
      :province         => Faker::Address.state_abbr,
      :type_id          => rand(14),
      :user_id          => (@@counter += 1),
      :description      => Faker::Lorem.paragraph(sentence_count = rand(5)),
      :website          => Faker::Internet.domain_name,
      :phone_number     => Faker::PhoneNumber.phone_number }
  end

  def build_availability(day)
    { :day             => day,
      :start_time      => 0,
      :end_time        => 24,
      :provider_id     => @@counter }
  end

  def build_appointment
    starts_at = DateTime.now.utc.beginning_of_hour + (rand(13)+1).days + rand(24).hours
    finishes_at = starts_at + rand(3) + 1
    if starts_at.day != finishes_at.day
      finishes_at = starts_at.end_of_day
    end

    { 
      :reason          => Faker::Lorem.sentence(word_count = 4),
      :description     => Faker::Lorem.sentence(word_count = 10),
      :provider_id     => rand(send(size)-1)+1,
      :client_id       => rand(send(size)-1)+1,
      :start_datetime  => starts_at,
      :end_datetime    => finishes_at   }
  end
  
  # called after faking out, use this method for additional updates or additions
  def post_fake
    @@counter = 1
    1.upto(send(size)) do
      7.times do |day|
        attributes = build_availability(day)
        Availability.create!(attributes)
      end
      @@counter += 1
    end
    puts "  * Availabilities: #{Availability.count(:all)}"    

    1.upto(send(size)) do
      attributes = build_appointment
      Appointment.create!(attributes)
    end
    puts "  * Appointments: #{Appointment.count(:all)}"  
  end

  # 3. optionally you can change these numbers, basically they are used to determine the number of models to create
  # and also the size of the tags array to choose from.  To check things work quickly use the tiny size (1 for everything)
  def tiny
    1
  end
  
  def small
    50
  end

  def medium
    250+rand(250)
  end

  def large
    1000+rand(500)
  end

  # END Customizing

  attr_accessor :all_tags, :size

  def initialize(size, prompt=true)
    self.size     = size
  end

  def fakeout
    puts "Faking it ... (#{size})"
    Fakeout.disable_mailers
    MODELS.each do |model|
      @@counter = 0
      if !respond_to?("build_#{model.downcase}")
        puts "  * #{model.pluralize}: **warning** I couldn't find a build_#{model.downcase} method"
        next
      end
      1.upto(send(size)) do
        attributes = send("build_#{model.downcase}")
        model.constantize.create!(attributes) if attributes && !attributes.empty?
      end
      puts "  * #{model.pluralize}: #{model.constantize.count(:all)}"
    end
    post_fake
    puts "Done, I Faked it!"
  end
  
  def self.prompt
    puts "Really? This will clean all #{MODELS.map(&:pluralize).join(', ')} from your database y/n? "
    STDOUT.flush
    (STDIN.gets =~ /^y|^Y/) ? true : exit(0)
  end

  def self.clean(prompt = true)
    self.prompt if prompt
    puts "Cleaning all ..."
    Fakeout.disable_mailers
    MODELS.each do |model|
      model.constantize.delete_all
    end
  end

  # by default, all mailings are disabled on faking out
  def self.disable_mailers
    ActionMailer::Base.perform_deliveries = false
  end
  
  
  private

  # useful for prepending to a string for getting a more unique string
  def random_letters(length = 2)
    Array.new(length) { (rand(122-97) + 97).chr }.join
  end

end


# the tasks, hook to class above - use like so;
# rake fakeout:clean
# rake fakeout:small[noprompt] - no confirm prompt asked, useful for heroku or non-interactive use
# rake fakeout:medium RAILS_ENV=bananas
#.. etc.
namespace :fakeout do

  desc "clean away all data"
  task :clean, [:no_prompt] => :environment do |t, args|
    Fakeout.clean(args.no_prompt.nil?)
  end
  
  desc "fake out a tiny dataset"
  task :tiny, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:tiny).fakeout
  end

  desc "fake out a small dataset"
  task :small, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:small).fakeout
  end

  desc "fake out a medium dataset"
  task :medium, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:medium).fakeout
  end

  desc "fake out a large dataset"
  task :large, [:no_prompt] => :clean do |t, args|
    Fakeout.new(:large).fakeout
  end
end
