import Rails from "@rails/ujs";
import "@hotwired/turbo-rails";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "controllers/hello_controller";
import "fonts/montserrat";

Rails.start();
ActiveStorage.start();

require.context('../icons', true);

require("stylesheets/application.css");
