import Rails from '@rails/ujs';
import '@hotwired/turbo-rails';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import 'controllers/admin/index';
import 'fonts/montserrat';

Rails.start();
ActiveStorage.start();

require.context('../icons/admin', true);

require('stylesheets/admin/application.css');
