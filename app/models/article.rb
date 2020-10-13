class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
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
