<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 숙소 조회</title>
<style>

@import "https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,700,700i|Raleway:300,400,500,700,800";

.body {
  background: #f9fbff;
}
a:hover {
  text-decoration: none;
}
.blog-card {
  display: flex;
  flex-direction: column;
  margin: 1rem auto;
  box-shadow: 4px 15px 25px -12px rgba(152, 182, 255, 0.4);
  margin-bottom: 1.6%;
  background: #fff;
  line-height: 1.4;
  border-radius: 6px;
  overflow: hidden;
  z-index: 0;
}
.blog-card a {
  color: inherit;
}
.blog-card a:hover {
  color: #ffc400;
}
.blog-card:hover .photo {
  -webkit-transform: scale(1.15) rotate(3deg);
  transform: scale(1.15) rotate(3deg);
}
.blog-card .meta {
  position: relative;
  z-index: 0;
  height: 200px;
}
.blog-card .photo {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-size: cover;
  background-position: center;
  transition: -webkit-transform 0.2s;
  transition: transform 0.2s;
  transition: transform 0.2s, -webkit-transform 0.2s;
}
.blog-card .description {
  padding: 1rem;
  background: #fff;
  position: relative;
  /* z-index: 1; */
}
.blog-card .description h1 {
  line-height: 1.35;
  margin: 0;
  font-weight: 500;
  font-size: 1.1rem;
  font-family: "open sans";
}
.blog-card .description h2 {
  font-size: 0.9rem;
  font-weight: 300;
  color: #a2a2a2;
  margin-top: 5px;
  font-family: "open sans";
}
.blog-card .description .read-more {
  padding-top: 8px;
  left: 0;
  right: 0;
  text-align: center;
  bottom: 6px;
  position: absolute;
  border-top: 1px solid #dadada;
  color: #3ebecc;
}
.blog-card .description .read-more a {
  color: #3ebecc;
  font-size: 16px;
  display: inline-block;
  position: relative;
  /*  border: 1px solid;
  padding: 2px 10px; */
  border-radius: 4px;
  text-transform: uppercase;
}
.blog-card .description .read-more:after {
  content: "\f061";
  font-family: FontAwesome;
  margin-left: -9px;
  opacity: 0;
  vertical-align: middle;
  transition: margin 0.3s, opacity 0.3s;
}
.blog-card .description .read-more:hover:after {
  margin-left: 10px;
  opacity: 1;
}
.blog-card p {
  position: relative;
  margin: 10px 0 0;
}
.blog-card p:first-of-type {
  margin-top: 1.25rem;
}
/*
.blog-card p:first-of-type:before {
  content: "";
  position: absolute;
  height: 4px;
  background: #3ebecc;
  width: 75px;
  top: -0.75rem;
} 
*/
.blog-card:hover .details {
  left: 0%;
}
@media (min-width: 640px) {
  .blog-card {
    flex-direction: row;
    min-height: 130px;
  }
  .blog-card .meta {
    flex-basis: 30%;
    height: auto;
  }
  .blog-card .description {
    flex-basis: 70%;
  }
  .blog-card .description:before {
    -webkit-transform: skewX(-3deg);
    transform: skewX(-3deg);
    content: "";
    background: #fff;
    width: 30px;
    position: absolute;
    left: -10px;
    top: 0;
    bottom: 0;
    z-index: -1;
  }
  .blog-card.alt {
    flex-direction: row-reverse;
  }
  .blog-card.alt .description:before {
    left: inherit;
    right: -10px;
    -webkit-transform: skew(3deg);
    transform: skew(3deg);
  }
  .blog-card.alt .details {
    padding-left: 25px;
  }
}




body {border: 1px red solid;}
</style>


</head>
<body>
       
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <img src="resources/img/business_logo.png" alt="">
                <div class="photo" style="background-image: url(/Helloing/src/main/webapp/resources/img/business_logo.png)"></div>
                <div class="photo" style="background-image: url(../../../../webapp/resources/img/admin_logo.png)"></div>
              </div>
              <div class="description">
                <h1>정말로 비싼 바로 그 호텔</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url()"></div>
              </div>
              <div class="description">
                <h1>제발 좀 먹어라</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url()"></div>
              </div>
              <div class="description">
                <h1>Lorem ipsum dolor sit amet</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url(https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=300)"></div>
              </div>
              <div class="description">
                <h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url(https://images.unsplash.com/photo-1576659325478-807b9c6757d8?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=300)"></div>
              </div>
              <div class="description">
                <h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url(https://images.unsplash.com/photo-1490367532201-b9bc1dc483f6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=300)"></div>
              </div>
              <div class="description">
                <h1>Lorem ipsum dolor sit amet</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url(https://images.unsplash.com/photo-1476231790875-016a80c274f3?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=300)"></div>
              </div>
              <div class="description">
                <h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url(https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=300)"></div>
              </div>
              <div class="description">
                <h1>Lorem ipsum dolor sit amet</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <div class="photo" style="background-image: url(https://images.unsplash.com/photo-1460925895917-afdab827c52f?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=50&w=300)"></div>
              </div>
              <div class="description">
                <h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h1>
                <h2 class="pt-1 pb-4">Sed venenatis elit id ligula cursus sollicitudin</h2>
                <p class="read-more">
                  <a href="#" target="_blank">Click Here</a>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>




</body>
</html>