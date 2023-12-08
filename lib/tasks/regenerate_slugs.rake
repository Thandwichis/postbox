namespace :letters do
    desc "Regenerate slugs for all letters"
    task regenerate_slugs: :environment do
      puts "Starting slug regeneration..."
  
      Letter.find_each do |letter|
        if letter.slug.blank?
          letter.save
          puts "Regenerated slug for letter ID: #{letter.id}"
        end
      end
  
      puts "Finished regenerating slugs."
    end
  end
  