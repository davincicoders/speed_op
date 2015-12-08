class Webstat < ActiveRecord::Base
  belongs_to :site

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |webstat|
        csv << webstat.attributes.values_at(*column_names)
      end
    end
  end
end
