module PresenterWrapper
  def wrap_with_presenter
    presenter.new(self)
  end

  private

  def presenter
    "#{self.class.name}Presenter".constantize
  end
end
