<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
  #bg {
    position: fixed;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
  }

  #bg img {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
    min-width: 50%;
    min-height: 50%;
  }
</style>

<body class="login">
  <div id="bg">
    <img src="https://i.ytimg.com/vi/CC1E8judHmY/maxresdefault.jpg" alt="">
  </div>
  <div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
      <div class="animate form login_form" style="padding:50% 0 0;">
        <section class="login_content">
          <div class="w3-panel w3-card-4 w3-white w3-round-large">
            <form class="user" method="post" action="<?= base_url('auth') ?>">
              <h1>Login</h1>
              <div>
                <input type="text" class="form-control form-control-user" id="username" name="username" placeholder="Username" autofocus>
                <?= form_error('username', '<small class="text-danger">', '</small>') ?>
              </div>
              <div>
                <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password">
                <?= form_error('password', '<small class="text-danger">', '</small>') ?>
              </div>
              <button type="submit" class="btn btn-default btn-primary ">
                Login
              </button>
            </form>
          </div>
        </section>
      </div>
    </div>
  </div>
</body>

</html>