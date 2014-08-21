class ClassOffer < ActiveRecord::Base

  has_attached_file :avatar, styles: { thumb: ["150x150#", :png], medium: ["300x300", :png] },
                             processors: [ :cropper ],
                             default_url: "https://d33z4cqleaobgx.cloudfront.net/assets/empty_profile_photo.png",
                             storage: :s3,
                             s3_credentials: { bucket: ENV['S3_BUCKET'], access_key_id: ENV['S3_ACCESS_KEY'], secret_access_key: ENV['S3_SECRET_ACCESS_KEY'] }

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  default_scope {order :start_date}

  validates_presence_of [ :name, :summary, :start_date, :end_date, :time, :non_member_cost, :standard_member_cost, :premier_member_cost, :teacher, :teacher_profile, :link ]
  validates_attachment :avatar, content_type: { :content_type => ["image/jpg", "image/gif", "image/png", "image/jpeg"], message: "must be png, jpg, or gif format" }
  before_save :update_costs

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    avatar_path = (avatar.options[:storage] == :s3) ? avatar.url(style) : avatar.path(style)
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar_path)
  end

  def self.active
    where status: "active"
  end

  def is_active?
    self.status == "active"
  end

  def is_closed?
    self.status == "closed"
  end

  def is_saved?
    self.status == "saved"
  end

  private

  def update_costs
    self.non_member_cost = self.non_member_cost.gsub('$', '').upcase
    self.standard_member_cost = self.standard_member_cost.gsub('$', '').upcase
    self.premier_member_cost = self.premier_member_cost.gsub('$', '').upcase
  end
end
