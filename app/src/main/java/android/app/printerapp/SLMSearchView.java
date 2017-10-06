package android.app.printerapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.SearchView;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.Arrays;

public class SLMSearchView extends ActionBarActivity {

    ArrayAdapter<String> sAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.search_activity);

        ListView lv = (ListView)findViewById(R.id.listViewSearch);
        ArrayList<String> sampledata = new ArrayList<>();
        sampledata.addAll(Arrays.asList(getResources().getStringArray(R.array.models_visibility_values)));

        sAdapter = new ArrayAdapter<String>(SLMSearchView.this,android.R.layout.simple_list_item_1,sampledata);
        lv.setAdapter(sAdapter);

        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent appInfo = new Intent(SLMSearchView.this,SLMData.class);
                startActivity(appInfo);
            }
        });

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.serach_menu,menu);
        // Inflate the menu; this adds items to the action bar if it is present.
        //getMenuInflater().inflate(R.menu.menu_main2, menu);
        MenuItem menuItem= menu.findItem(R.id.app_bar_search);
        System.out.println("####################"+menuItem);
        System.out.println("***"+menuItem.getActionView());

        SearchView searchview = (SearchView)menuItem.getActionView();
        searchview.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                sAdapter.getFilter().filter(newText);

                return false;
            }
        });


        return super.onCreateOptionsMenu(menu);
    }



}
