require 'rails_helper'

RSpec.describe Discussion, type: :model do
  it { should belong_to(:user) }

  it { should belong_to(:topic) }

  it { should validate_length_of(:comment).is_at_least(3) }
end
