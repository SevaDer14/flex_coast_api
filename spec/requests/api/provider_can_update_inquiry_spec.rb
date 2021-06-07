RSpec.describe 'PUT /api/inquiries/:id', type: :request do
  let!(:inquiry) {create(:inquiry, inquiry_status: 'pending')}
  describe 'successfully' do
    before do
      put "/api/inquiries/#{inquiry.id}",
          params: {
            form_data: { inquiry_status: 'started' }
          }
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to respond with a message' do
      expect(response_json['message']).to eq 'Inquiry has been updated'
    end

    it 'is expected to set inquiry status to started' do
      expect(response_json['inquiry']['inquiry_status']).to eq 'started'
    end
  end
end