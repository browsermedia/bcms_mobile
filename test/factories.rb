Factory.define :public_section, :parent => :section do |s|
  s.after_create { |section|
    section.allow_groups = :all
  }
end

Factory.define :published_page, :parent=>:page do |m|
  m.publish_on_save true
  m.association :section, :factory=>:public_section
end