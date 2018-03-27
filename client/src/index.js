import React from 'react';
import ReactDOM from 'react-dom';
import 'semantic-ui-css/semantic.min.css';
import registerServiceWorker from './registerServiceWorker';
import AppRouter from './AppRouter';

ReactDOM.render(<AppRouter />, document.getElementById('root'));
registerServiceWorker();
