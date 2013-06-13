module PostalCode
  class Postal
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    ATTRIBUTES = [:jis_code, :post_office_name_kana, :post_office_name_kanji, :province,
    :city, :town, :number, :post_number, :post_former_number, :telegraph_office,
    :classification_number, :plural_tag, :update_code]

    attr_accessor :jis_code, :post_office_name_kana, :post_office_name_kanji, :province,
    :city, :town, :number, :post_number, :post_former_number, :telegraph_office,
    :classification_number, :plural_tag, :update_code

    def initialize (attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def match_conditions? conditions
      conditions.each {|key, value| return false if self.send(key) != value}
      true
    end

    def persisted?
      false
    end

  end
end
