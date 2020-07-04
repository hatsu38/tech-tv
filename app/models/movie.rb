# == Schema Information
#
# Table name: movies
#
#  id             :bigint           not null, primary key
#  url(動画のURL) :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Movie < ApplicationRecord
  belongs_to :event
end
