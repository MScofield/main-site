class StaticPage
  include ActiveModel::Model

  PAGES = [
     { title: 'Home', slug: 'index' },
     { title: 'About', slug: 'about' },
     { title: 'Meet the team', slug: 'meet_the_team' },
     { title: 'Blog', slug: 'blog' },
     { title: 'Work', slug: 'work' },
     { title: 'Donate', slug: 'donate' },
     { title: 'Contact', slug: 'contact' },
     { title: 'Sponsor', slug: 'sponsor' },
     { title: 'Financial Info', slug: 'financial_info' }
  ]

  attr_accessor :title, :slug

  alias_attribute :name, :title

  class << self
    def all
      @all ||= begin
        PAGES.map do |page|
          new(page)
        end
      end
    end

    def [](slug)
      PAGES.find { |p| p[:slug] == slug.to_s }
    end

    def titles
      PAGES.map { |p| p[:title] }
    end

    def slugs
      PAGES.map { |p| p[:slug] }
    end
  end

end
