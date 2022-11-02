class State < ActiveHash::Base
  self.data = [
    { id: 1, state: '---' },
    { id: 2, state: '新品・未使用' },
    { id: 3, state: '未使用に近い' },
    { id: 4, state: '目立った傷や汚れなし' },
    { id: 5, state: 'やや傷や汚れあり' },
    { id: 6, state: '傷や汚れあり' },
    { id: 7, state: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
