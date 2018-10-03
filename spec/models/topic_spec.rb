require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should belong_to(:forum) }

  it { should have_many(:discussion).dependent(:destroy) }

  it { should validate_length_of(:title).is_at_least(11) }

  it { should validate_length_of(:text).is_at_least(16) }
end
