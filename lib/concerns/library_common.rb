module Concerns
  module LibraryCommon
    def self.included(base)
      base.extend(CommonClass)
    end

    def save
      self.class.all.push(self) unless self.class.all.include?(self)
      self
    end

    module CommonClass
      def all
        class_variable_get(:@@all)
      end

      def destroy_all
        all.clear
      end

      def create(name)
        new(name).save
      end
    end
  end
end