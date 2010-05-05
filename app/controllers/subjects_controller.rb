class SubjectsController < ApplicationController
  # GET /subjects
  def index(period = "all")
    @q = params[:q]
    total_entries = Subject.total_entries(period) if @q.blank?
    order = @q.blank? ? SUBJECT_ORDER[period] : "term"
    @subjects = Subject.search @q, :page => params[:page], :order => order, :conditions => "subjects.#{period}_major > 0", :total_entries => total_entries, :include => :subject_stats
    order = {}
    order["all"]   = %w(one_to_all five_to_all ten_to_all)
    order["one"]   = %w(one_to_all one_to_five one_to_ten)
    order["five"]  = %w(one_to_five five_to_ten five_to_all)
    order["ten"]   = %w(one_to_ten five_to_ten ten_to_all)
    @rf_subjects = []
    order[period].each do |o|
      @rf = Subject.find :all, :order => "#{o}_score desc", :limit => 20
      @rf_subjects.push(@rf)
    end
    @rf_subjects.flatten!.uniq!.sort! {|a, b| (b.one_to_five_score + b.one_to_ten_score + b.one_to_all_score + b.five_to_ten_score + b.five_to_all_score + b.ten_to_all_score) <=> (a.one_to_five_score + a.one_to_ten_score + a.one_to_all_score + a.five_to_ten_score + a.five_to_all_score + a.ten_to_all_score)}

    respond_to do |format|
      format.html { render :action => "index"}
    end
  end

  # GET /subjects/1
  def show(period = "all")
    @subject = Subject.find(params[:id])
    total_entries = @subject.send("#{period}_total")
    per_page = per_page(total_entries)
    @articles = []
    @articles = @subject.articles.paginate :page => params[:page], :per_page => per_page, :total_entries => total_entries if total_entries > 0
    respond_to do |format|
      format.html  { render :action => "show"}
    end
  end
end
