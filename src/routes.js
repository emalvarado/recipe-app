import React from 'react'
import {Route, Switch} from 'react-router-dom'
import LandingPage from './components/Landing/LandingPage'
import Auth from './components/Auth/Auth'
import RecipesList from './components/RecipesList/RecipesList'
import Recipe from './components/Recipe/Recipe'

export default(
  <Switch>
    <Route exact path='/' component={LandingPage} />
    <Route path='/login' component={Auth} />
    <Route path='/recipes' component={RecipesList} />
    <Route path='/recipes/:recipe_id' component={Recipe} />
  </Switch>
)