require 'rails_helper'

RSpec.describe Forum, type: :model do
  it { should have_many(:topics).dependent(:destroy) }

  it { should validate_length_of(:title).is_at_least(6) }
end
