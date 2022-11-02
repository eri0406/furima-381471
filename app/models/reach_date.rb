class ReachDate < ActiveHash::Base
  self.data = [
    { id: 1, reach_date: '---' },
    { id: 2, reach_date: '1~2日で発送' },
    { id: 3, reach_date: '2~3日で発送' },
    { id: 4, reach_date: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
