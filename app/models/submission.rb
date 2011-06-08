class Submission
  KindSelect = [['Short Story','story'],['Chapter','chapter'],['Prologue','prologue'],['Partial Chapter','partial_chapter'],['Synopsis','synopsis']]
  Kinds = KindSelect.map{|n,v| v}
  GenreSelect = [['Science Fiction','sf'],['Fantasy','fantasy'],['Horror','horror'],['Cross Genre','mixed'],['']]
  Genres = GenreSelect.map{|n,v| v}
  StatusSelect = [['Early Draft','early_draft'],['Middle Draft','middle_draft'],['Polished','polished']]
  Statuses = StatusSelect.map{|n,v| v}
  AudienceSelect = [['Adult','adult'],['Adult Only','adult_only'],['Young Adult','young_adult'],['Children','children']]
  Audiences = AudienceSelect.map{|n,v| v}
  include Mongoid::Document
  field :title, :type => String
  field :user_id, :type => String
  field :kind, :type => String
  field :genre, :type => String
  field :audience, :type => String
  field :status, :type => String
  field :author_notes, :type => String
  field :submission, :type => String
  validates_presence_of :title,:user_id,:shop_id,:submission
  validates_inclusion_of :kind, :in => Kinds
  validates_inclusion_of :genre, :in => Genres
  validates_inclusion_of :status, :in => Statuses, :allow_blank => true
  validates_inclusion_of :audience, :in => Audiences
  belongs_to :user
  belongs_to :shop
end
