class Message < ApplicationRecord
	belongs_to :user
	validates :body, presence: true
	scope :infinite_scroll_paginate, -> { order(:created_at).last(20) }
end
