@extends('admin.layout.include')

@section('content')

    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Create Category</h4>
                            <form class="forms-sample" action="{{route('post-category')}}" method="post">
                                @csrf
                                <div class="form-group">
                                    <label for="exampleInputUsername1">Name</label>
                                    <input type="text" class="form-control" name="name" placeholder="Category Name" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
{{--                                    <input type="email" class="form-control" id="exampleInputEmail1" value="{{$user->first_name}} {{$user->last_name}}" readonly>--}}
                                    <input type="email" class="form-control" id="exampleInputEmail1" readonly>
                                </div>

                                <button type="submit" class="btn btn-primary mr-2">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
