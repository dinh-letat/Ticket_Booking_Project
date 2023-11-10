// Trong App.jsx hoặc index.jsx
import './App.css';
import { BrowserRouter as Router, Route, Switch, Routes } from 'react-router-dom';

import Register from './components/auth/Register';
import Login from './components/auth/Login';

function App() {
  return (
      <Routes>
        <Route path="/login" component={Login} />
        <Route path="/register" component={Register} />
      </Routes>
  );
}

export default App;
