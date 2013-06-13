module PostalCode
  class Postal
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    ATTRIBUTES = [:jis_code, :former_post_code, :post_code, :province_kana, :city_kana, 
    :town_kana, :province_kanji, :city_kanji, :town_kanji, :plural_code, :unknow, 
    :district_of_a_town, :plural_town, :update, :update_reason]

    attr_accessor :jis_code, :former_post_code, :post_code, :province_kana, :city_kana, 
    :town_kana, :province_kanji, :city_kanji, :town_kanji, :plural_code, :unknow, 
    :district_of_a_town, :plural_town, :update, :update_reason 

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
