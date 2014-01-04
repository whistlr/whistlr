shared_examples "versionable" do |type|

  it "creates a version after creation" do
    expect(create(type).versions).to_not be_nil
  end

  it "clones the initial version from its own attributes" do
    versionable = create(type)
    version = versionable.initial_version
    versionable.attributes.except("id", "type", "approved", "pending", "declined", "master_id", "slug").each do |attr|
      expect(attr[1]).to eq version.public_send(attr[0])
    end
  end

  it "returns its initial version" do
    versionable = create(type)
    expect(versionable.initial_version).to eq versionable.versions.first
  end

  describe "versions are approvable" do
    before :each do
      @versionable = create(type)
      type_version = type.to_s.gsub("master", "version").to_sym
      @version_approved_1 = create(type_version, master: @versionable)
      @version_approved_2 = create(type_version, master: @versionable)
      @version_pending_1 = create(type_version, master: @versionable)
      @version_pending_2 = create(type_version, master: @versionable)
      @version_declined_1 = create(type_version, master: @versionable)
      @version_declined_2 = create(type_version, master: @versionable)
      @version_approved_1.success
      @version_approved_2.success
      @version_declined_1.failure
      @version_declined_2.failure
    end

    it "returns its approved versions" do
      expect(@versionable.approved_versions).to match_array([@version_approved_1, @version_approved_2])
    end

    it "returns its last approved version" do
      expect(@versionable.last_approved_version).to eq @version_approved_2
    end
  end

  describe "has a scope for" do
    before :each do
      @versionable_approved_1 = create(type, approved: true, pending: false)
      @versionable_approved_2 = create(type, approved: true, pending: false)
      @versionable_pending_1 = create(type)
      @versionable_pending_2 = create(type)
      @versionable_declined_1 = create(type, declined: true, pending: false)
      @versionable_declined_2 = create(type, declined: true, pending: false)
      @class = type.to_s.gsub("_", "/").camelize.constantize
    end

    context "approved versionables" do
      it "returns approved versionables" do
        expect(@class.approved).to match_array([@versionable_approved_1, @versionable_approved_2])
      end
    end

    context "pending versionables" do
      it "returns pending versionables" do
        expect(@class.pending).to match_array([@versionable_pending_1, @versionable_pending_2])
      end
    end

    context "declined versionables" do
      it "returns declines versionables" do
        expect(@class.declined).to match_array([@versionable_declined_1, @versionable_declined_2])
      end
    end

    context "non-declined versionables" do
      it "returns non-declined versionables" do
        expect(@class.not_declined).to match_array([@versionable_approved_1, @versionable_approved_2, @versionable_pending_1, @versionable_pending_2])
      end
    end
  end
end