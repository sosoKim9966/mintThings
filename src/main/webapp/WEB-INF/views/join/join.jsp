<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Log In | Minton - Admin & Dashboard Template</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
  <meta content="Coderthemes" name="author" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- App favicon -->
  <link rel="shortcut icon" href="../static/assets/images/favicon.ico">

  <!-- App css -->
  <link href="/resources/static/assets/css/modern/bootstrap-modern.min.css" rel="stylesheet" type="text/css" id="bs-default-stylesheet" />
  <link href="/resources/static/assets/css/modern/app-modern.min.css" rel="stylesheet" type="text/css" id="app-default-stylesheet" />

  <link href="/resources/static/assets/css/modern/bootstrap-modern-dark.min.css" rel="stylesheet" type="text/css" id="bs-dark-stylesheet" />
  <link href="/resources/static/assets/css/modern/app-modern-dark.min.css" rel="stylesheet" type="text/css" id="app-dark-stylesheet" />

  <!-- icons -->
  <link href="/resources/static/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

</head>

<div class="row">
<div class="col-12">
  <div class="card">
    <div class="card-body">
      <h4 class="header-title">Input Types</h4>
      <p class="sub-header">
        Most common form control, text-based input fields. Includes support for all HTML5 types: <code>text</code>, <code>password</code>, <code>datetime</code>, <code>datetime-local</code>, <code>date</code>, <code>month</code>, <code>time</code>, <code>week</code>, <code>number</code>, <code>email</code>, <code>url</code>, <code>search</code>, <code>tel</code>, and <code>color</code>.
      </p>

      <div class="row">
        <div class="col-12">
          <div class="p-2">
            <form class="form-horizontal" role="form">
              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="simpleinput">Text</label>
                <div class="col-md-10">
                  <input type="text" id="simpleinput" class="form-control" value="Some text value...">
                </div>
              </div>
              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-email">Email</label>
                <div class="col-md-10">
                  <input type="email" id="example-email" name="example-email" class="form-control" placeholder="Email">
                </div>
              </div>
              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-password">Password</label>
                <div class="col-md-10">
                  <input type="password" class="form-control" id="example-password" value="password">
                </div>
              </div>
              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="password">Show/Hide Password</label>
                <div class="col-md-10">
                  <div class="input-group input-group-merge">
                    <input type="password" id="password" class="form-control" placeholder="Enter your password">
                    <div class="input-group-text" data-password="false">
                      <span class="password-eye"></span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-placeholder">Placeholder</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" id="example-placeholder" placeholder="placeholder">
                </div>
              </div>
              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-textarea">Text area</label>
                <div class="col-md-10">
                  <textarea class="form-control" id="example-textarea" rows="5"></textarea>
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label">Readonly</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" readonly="" value="Readonly value">
                </div>
              </div>
              <div class="mb-2 row">
                <label class="col-md-2 col-form-label">Disabled</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" disabled="" value="Disabled value">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2  col-form-label" for="example-static">Static control</label>
                <div class="col-md-10">
                  <input type="text" readonly="" class="form-control-plaintext" id="example-static" value="email@example.com">
                </div>
              </div>
              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-helping">Helping text</label>
                <div class="col-md-10">
                  <input type="text" class="form-control" id="example-helping" placeholder="Helping text">
                  <span class="help-block"><small>A block of help text that breaks onto a new line and may extend beyond one line.</small></span>
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label">Input Select</label>
                <div class="col-md-10">
                  <select class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                  <h6>Multiple select</h6>
                  <select multiple class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                  </select>
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-fileinput">Default file input</label>
                <div class="col-md-10">
                  <input type="file" class="form-control" id="example-fileinput">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-date">Date</label>
                <div class="col-md-10">
                  <input class="form-control" type="date" name="date" id="example-date">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-month">Month</label>
                <div class="col-md-10">
                  <input class="form-control" type="month" id="example-month" name="month">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-time">Time</label>
                <div class="col-md-10">
                  <input class="form-control" type="time" id="example-time" name="time">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-week">Week</label>
                <div class="col-md-10">
                  <input class="form-control" type="week" id="example-week" name="week">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-number">Number</label>
                <div class="col-md-10">
                  <input class="form-control" type="number" id="example-number" name="number">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label">URL</label>
                <div class="col-md-10">
                  <input class="form-control" type="url" name="url">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label">Search</label>
                <div class="col-md-10">
                  <input class="form-control" type="search" name="search">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label">Tel</label>
                <div class="col-md-10">
                  <input class="form-control" type="tel" name="tel">
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="example-color">Color</label>
                <div class="col-md-10">
                  <input class="form-control form-control-color mw-100" type="color" id="example-color" name="color" value="#3bafda" >
                </div>
              </div>

              <div class="mb-2 row">
                <label class="col-md-2 col-form-label" for="form-range">Form range</label>
                <div class="col-md-10 align-self-center">
                  <input class="form-range" type="range" id="form-range" name="range" min="0" max="10">
                </div>
              </div>

              <div class="row">
                <label for="exampleDataList" class="col-md-2 col-form-label">Datalists</label>
                <div class="col-md-10">
                  <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">
                  <datalist id="datalistOptions">
                    <option value="San Francisco">
                    <option value="New York">
                    <option value="Seattle">
                    <option value="Los Angeles">
                    <option value="Chicago">
                  </datalist>
                </div>
              </div>

            </form>
          </div>
        </div>

      </div>
      <!-- end row -->
    </div>
  </div> <!-- end card -->
</div><!-- end col -->
</div>
<!-- end row -->
