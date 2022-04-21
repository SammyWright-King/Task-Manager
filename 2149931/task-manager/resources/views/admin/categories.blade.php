@extends('admin.layout.include')

@section('content')
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">Categories</p>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table id="example" class="display expandable-table" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>id#</th>
                                                <th>Name</th>
                                                <th>No of Tasks</th>
                                                <th>Created</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($categories as $category)
                                                <tr>
                                                    <td>{{$loop->iteration}}</td>
                                                    <td>{{$category->name}}</td>
                                                    <td>{{$category->tasks()->count()}}</td>
                                                    <td>{{\Illuminate\Support\Carbon::parse($category->created_at)->toDayDateTimeString()  }}</td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
