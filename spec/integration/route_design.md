# {{ METHOD }} {{ PATH}} Route Design Recipe

Add a route GET /artists which returns an HTML page with the list of artists. This page should contain a link for each artist listed, linking to /artist/:id where :id needs to be the corresponding album id.

## 1. Design the Route Signature
# Request:
GET /albums/new

# With body parameters:
None


# Expected response (200 OK)
html page containing a form

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

```html


<html>
  <body>
    <form action="/albums" method="POST">
      <input type="text" name="title">
      <input type="text" name="release_year">
      <input type="number" name="artist_id">
      <input type="submit" value="Create Artist">
    </form>
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
``` htm

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
