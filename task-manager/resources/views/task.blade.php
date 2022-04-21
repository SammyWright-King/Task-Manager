<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TASK MANAGER</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="{{asset('assets/favicon.ico')}}" />
        <link href="{{asset('assets/css/styles.css')}}" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="{{route('all-tasks')}}">Task Manager</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#!">logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                    <img class="img-fluid rounded mb-4 mb-lg-0" src="{{asset("storage/".$task->image_url)}}" onerror="this.src='https://dummyimage.com/900x400/dee2e6/6c757d.jpg'"/>
                </div>
                <div class="col-lg-5">
                    <h1 class="font-weight-light">{{$task->title}}</h1>
                    <p>{{$task->description}}</p>

                    @if($task->user->id == auth()->user()->id)
                        <a class="btn btn-primary" href="{{route('edit.task', $task->id)}}">Edit Task</a>
                    @endif
                </div>
            </div>

            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body">
                    <div class="mb-3 row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Comment</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" id="comment-id" rows="2"></textarea>
                        </div>
                        <div class="col-auto">
                            <button type="button" class="btn btn-primary mb-3" onclick="SubmitComment('{{$task->id}}')">Save Comment</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5" id="comment-div">
                @foreach($task->comments as $comment)
                    <div class="col-md-4 mb-5">
                        <div class="card h-100">
                            <div class="card-body">
{{--                                <h2 class="card-title">{{"{$comment->user->first_name} {$comment->user->last_name}"}}</h2>--}}
                                <p class="card-text">{{\Illuminate\Support\Str::limit($comment->comment, 30)}}</p>
                            </div>
{{--                            <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">More Info</a></div>--}}
                            <div class="card-footer"></div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

        <!-- Core theme JS-->
        <script src="{{asset('assets/js/scripts.js')}}"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script>
            //submit Comment
            let SubmitComment= (id)=>{
                let comment = $('#comment-id').val()
                let url = "/task/"+ id + "/comment"

                $.ajax({
                    type: 'POST',
                    url : url,
                    data: {"_token": "{{ csrf_token() }}", comment: comment},
                    success : (result)=>{
                        console.log(result)

                        alert('Comment saved successfully!')
                        //reload page
                        location.reload()
                    }
                })
            }

            $(document).ready(()=>{
                $('#comment-id').val("")
            })
        </script>
    </body>
</html>
