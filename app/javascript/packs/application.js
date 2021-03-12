import Rails from '@rails/ujs';
import '@hotwired/turbo-rails';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import 'controllers/app/index';
import 'fonts/montserrat';

Rails.start();
ActiveStorage.start();

require.context('../icons/app', true);

require('stylesheets/app/application.css');
