# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  it { should route(:get, '/index').to(action: :index) }
  it { should route(:get, '/events/1').to(action: :show, id: 1) }
  it { should route(:get, '/create').to(action: :new) }
end
