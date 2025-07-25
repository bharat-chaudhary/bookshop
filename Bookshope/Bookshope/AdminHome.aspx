<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Bookshope.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link href="Css/StyleSheet1.css" rel="stylesheet" />
<link rel="apple-touch-icon" sizes="180x180" href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="favicon_io/site.webmanifest">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <!-- home section starts  -->

<section class="home" id="home">

    <div class="row">

        <div class="content">
            <h3>upto 75% off</h3>
            <p>If you’re an Engineering student and need a books, Books4MU has great deals on a wide range of books. Shop for these books from top authors and avail hugely discounted prices</p>
            <a href="#" class="btn">shop now</a>
        </div>

        <div class="swiper books-slider"> 
            <div class="swiper-wrapper">
                <a href="#"><img src="images/Adv1.jfif"></a>
                <a href="#"><img src="images/Adv2.jfif" alt=""></a>
                <a href="#" ><img src="images/c5.jfif" alt=""></a>
                <a href="#"><img src="images/adv6.jfif" alt=""></a>
                <a href="#"><img src="images/c3.jfif" alt=""></a>
                <a href="#"><img src="images/c2.jfif" alt=""></a>
            </div>
            <img src="https://raw.githubusercontent.com/KordePriyanka/Books4MU-Book-Store-Website-/main/image/stand.png" class="stand" alt="">
        </div>

    </div>

</section>

<!-- home section ense  -->

<!-- icons section starts  -->

<section class="icons-container">

    <div class="icons">
        <i class="fas fa-shipping-fast"></i>
        <div class="content">
            <h3>free shipping</h3>
            <p>order over $100</p>
        </div>
    </div>

    <div class="icons">
        <i class="fas fa-lock"></i>
        <div class="content">
            <h3>secure payment</h3>
            <p>100 secure payment</p>
        </div>
    </div>

    <div class="icons">
        <i class="fas fa-redo-alt"></i>
        <div class="content">
            <h3>easy returns</h3>
            <p>10 days returns</p>
        </div>
    </div>

    <div class="icons">
        <i class="fas fa-headset"></i>
        <div class="content">
            <h3>24/7 support</h3>
            <p>call us anytime</p>
        </div>
    </div>

</section>
  
<!-- icons section ends -->
    <!-- newsletter section starts -->

<section class="newsletter">

    <form action="">
        <h3>subscribe for latest updates</h3>
        <input type="email" name="" placeholder="enter your email" id="" class="box">
        <input type="submit" value="subscribe" class="btn">
    </form>

</section>

<!-- newsletter section ends -->
    <!-- reviews section starts  -->

<section class="reviews" id="reviews">

    <h1 class="heading"> <span>client's reviews</span> </h1>

    <div class="swiper reviews-slider">

        <div class="swiper-wrapper">

            <div class="swiper-slide box" style="width:30%;">
                <img src="images/p2.jfif" alt="">
                <h3>Bharat Chaudhary</h3>
                <p>First of all it customer service is excellent. We get all author book for Mumbai University. People should try here affordable and best price.</p>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
            </div>

            <div class="swiper-slide box" style="width:30%;">
                <img src="images/p2.jfif" alt="">
                <h3>Bharat Chaudhary </h3>
                <p>Best book store almost all books are available for prepartion of exam related or other books are available on reaonable price also.</p>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
            </div>

            <div class="swiper-slide box" style="width:30%;">
                <img src="images/p2.jfif" alt="">
                <h3>Bharat Chaudhary </h3>
                <p>Customer Service is good. Greetings to customer and making the required Books available to Customers is very good.</p>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
            </div>
        
           
           

        </div>

    </div>

</section>

<!-- reviews section ends -->
    <!-- footer section starts  -->

<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>our locations</h3>
            <a href="#"> <i class="fas fa-map-marker-alt"></i> india </a>
            <a href="#"> <i class="fas fa-map-marker-alt"></i> USA </a>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="./index.html"> <i class="fas fa-arrow-right"></i> home </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> featured </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> Category </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> reviews </a>
            <a href="./feedback.html"> <i class="fas fa-arrow-right"></i> feedback </a>
        </div>

        <div class="box">
            <h3>extra links</h3>
            <a href="#"> <i class="fas fa-arrow-right"></i> account info </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> ordered items </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> privacy policy </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> payment method </a>
            <a href="#"> <i class="fas fa-arrow-right"></i> our serivces </a>
        </div>

        <div class="box">
            <h3>contact info</h3>
            <a href="#"> <i class="fas fa-phone"></i>9723346947 </a>
            <a href="#"> <i class="fas fa-phone"></i> 9537246947 </a>
            <a href="#"> <i class="fas fa-envelope"></i> bharatchaudhary7748@gmail.com </a>
            <a href="#"> <i class="fas fa-envelope"></i> chaudharybharat97233@gmail.com </a>
            <img src="https://raw.githubusercontent.com/KordePriyanka/Books4MU-Book-Store-Website-/main/image/worldmap.png" class="map" alt="">
        </div>

    </div>

    <div class="share">
        <a href="#" class="fab fa-facebook-f"></a>
        <a href="#" class="fab fa-twitter"></a>
        <a href="#" class="fab fa-instagram"></a>
        <a href="#" class="fab fa-linkedin"></a>
        <a href="#" class="fab fa-linkedin"></a>
    </div>

    <div class="credit"> created by <span>Bharat Chaudhary </span>copyright ©2024 all rights reserved! </div>

</section>

<!-- footer section ends -->
    <script src="main.js"></script>

</asp:Content>
