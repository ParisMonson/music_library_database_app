# {{ METHOD }} {{ PATH}} Route Design Recipe

Add a route GET /artists which returns an HTML page with the list of artists. This page should contain a link for each artist listed, linking to /artist/:id where :id needs to be the corresponding album id.

## 1. Design the Route Signature
# Request:
GET /artists

# With body parameters:
None


# Expected response (200 OK)
html page with all Artists and info

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1><a href='/artists/1'>Pixies</a></h1>
    <div>Genre: Rock</div>
  </body>

  <body>
    <h1><a href='/artists/2'>ABBA</a></h1>
    <div>Genre: Pop</div>
  </body>

  .......

</html>
```

```html
<

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /artists

# Expected response:

Response for 200 OK
``` html

<html>
  <head></head>
  <body>
    <h1><a href='/artists/1'>Pixies</a></h1>
    <div>Genre: Rock</div>
  </body>

  <body>
    <h1><a href='/artists/2'>ABBA</a></h1>
    <div>Genre: Pop</div>
  </body>


## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb



  context "GET /artists/" do
    it 'returns 200 OK and all artist information' do
      response = get('/artists/')
      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Pixies</h1>'
      expect(response.body).to include '<h1>ABBA</h1>'
      expect(response.body).to include '<div>Genre: Rock</div>'
    end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=resources/sinatra_route_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=resources/sinatra_route_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=resources/sinatra_route_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=resources/sinatra_route_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy/web-applications&prefill_File=resources/sinatra_route_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
