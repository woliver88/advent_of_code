data: read0 `:w4data_test.txt;

pad: {[data]
    data_pad: ".",/:data,\:".";
    size_data: count first data_pad;
    data_pad: (#[size_data;"."]),data_pad,enlist #[size_data;"."];
    break`
    :data_pad;
    }