class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings
    def tag_list
        tags.collect do |tag|
            tag.name
        end.join(",")
    end

    def tag_list=(tag_strings)
        tag_names=tag_strings.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags=tag_names.collect{|s| Tag.find_or_create_by(name: s)}
        self.tags=new_or_found_tags
    end
end
