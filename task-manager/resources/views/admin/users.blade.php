@extends('admin.layout.include')

@section('content')
    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">Users</p>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table id="example" class="display expandable-table" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>id#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Gender</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($users as $user)
                                                    <tr>
                                                        <td>{{$loop->iteration}}</td>
                                                        <td>{{$user->first_name}} {{$user->last_name}}</td>
                                                        <td>{{$user->email }}</td>
                                                        <td>{{$user->gender}}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                        {{ $users->links() }}
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
