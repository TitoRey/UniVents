class HomepageController < ApplicationController
    before_action :authenticate_user!, :only => [:homepage]

    def index 
        render
    end
    def style
        render
    end
end
