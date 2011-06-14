class ParamFilter
  def initialize(params)
    @params = params
  end

  def filter_empty_passwords
    password_params_empty? ? delete_password_params : @params
  end

  private

  def delete_password_params
    @params.delete("password") and @params.delete("password_confirmation")
    @params
  end

  def password_params_empty?
    @params["password"].empty? and @params["password_confirmation"].empty? rescue false
  end
end
