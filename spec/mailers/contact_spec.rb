require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe '#send_mail' do
    let(:contact) { create(:contact) }
    let(:mail) { described_class.send_mail(contact) }

    it "formが正しいこと" do
      expect(mail.from).to eq ["from@example.com"]
    end

    it "toが正しいこと" do
      expect(mail.to).to eq ["spla3.gear.posting@gmail.com"]
    end

    it "subjectが正しいこと" do
      expect(mail.subject).to eq "ギア編成投稿所より問い合わせが届きました"
    end

    it "bodyが正しいこと" do
      expect(mail.body).to match /スプラトゥーン3ギア編成投稿所に問い合わせがありました。/
    end
  end
end
