class Content < ApplicationRecord
    # this is required to set the name of a column to "type".
    self.inheritance_column = nil

    validates :title, presence: true, uniqueness: true
    validates :type, presence: true
    
    # _suffix needs to be set to true since map and length are reserved words in ActiveRecord.
    enum type: {
        map: 0,
        blueprint: 1,
        marker: 2,
        mapping: 3,
        length:4,
        area: 5,
        volume: 6
    }, _suffix: true
    
    belongs_to :project
    belongs_to :user
end
