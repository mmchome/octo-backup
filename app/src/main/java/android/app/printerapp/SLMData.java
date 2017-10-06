package android.app.printerapp;


import android.app.AlertDialog;
import android.support.v7.app.ActionBarActivity;

import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;

import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

import com.google.common.collect.ImmutableMap;
import com.strongloop.android.loopback.Model;
import com.strongloop.android.loopback.ModelRepository;
import com.strongloop.android.loopback.RestAdapter;
import com.strongloop.android.loopback.callbacks.ObjectCallback;

public class SLMData extends ActionBarActivity {


    /**
     * The {@link android.support.v4.view.PagerAdapter} that will provide
     * fragments for each of the sections. We use a
     * {@link FragmentPagerAdapter} derivative, which will keep every
     * loaded fragment in memory. If this becomes too memory intensive, it
     * may be best to switch to a
     * {@link android.support.v4.app.FragmentStatePagerAdapter}.
     */
   // private SectionsPagerAdapter mSectionsPagerAdapter;
    ArrayAdapter<String> sAdapter;

    /**
     * The {@link ViewPager} that will host the section contents.
     */
    private ViewPager mViewPager;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.slmdata);
       /*
        !!!!!
        How to query

        RestAdapter adapter = new RestAdapter(getApplicationContext(), "http://api.lizardhead.xyz:3000/api");
        ModelRepository partRepository = adapter.createRepository("Part");

        partRepository.findById("part2", new ObjectCallback<Model>() {
            @Override
            public void onSuccess(Model part) {
                // found!
                System.out.println("##### query find worked :) !!!!");
                System.out.println("##### the project for the part was.. data should have fifi in it  "+ part.toMap().values());
            }

            public void onError(Throwable t) {
                // handle the error
                System.out.println("##### mmhhh db had this issue with find "+ t.getMessage());
            }
        });

        */

        /*
        !!!!!!
        HOW TO DO SAVE
        Model part = partRepository.createObject( ImmutableMap.of("PartId", "part3", "ProjectId","fifi", "StlFileName","part3.stl", "CadFileName","part3.cad") );

        part.save(new Model.Callback() {
            @Override
            public void onSuccess() {
                // saved!
                System.out.println("##### saving worked dude check the db :) !!!!");
            }
            @Override
            public void onError(Throwable t) {
                // handle errors
                System.out.println("##### mmhhh db had this issue  "+ t.getMessage());
            }
        });

       */
        TextView parts = (TextView) findViewById(R.id.mark);
        parts.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String names[] ={"A","B","C","D"};
                AlertDialog.Builder alertDialog = new AlertDialog.Builder(SLMData.this);
                LayoutInflater inflater = getLayoutInflater();
                View convertView = (View) inflater.inflate(R.layout.partlist, null);
                alertDialog.setView(convertView);
                alertDialog.setTitle("List");
                ListView lv = (ListView) convertView.findViewById(R.id.PartslistView);
                ArrayAdapter<String> adapter = new ArrayAdapter<String>(SLMData.this,android.R.layout.simple_list_item_1,names);
                lv.setAdapter(adapter);
                alertDialog.show();

            }
        });
    }

    
    public class Part extends Model{

        private String PartId;
        private String ProjectId;
        private String StlFileName;
        private String CadFileName;

        public String getStlFileName() {
            return StlFileName;
        }

        public void setStlFileName(String stlFileName) {
            StlFileName = stlFileName;
        }

        public String getCadFileName() {
            return CadFileName;
        }

        public void setCadFileName(String cadFileName) {
            CadFileName = cadFileName;
        }

        public String getPartId() {
            return PartId;
        }

        public void setPartId(String partId) {
            PartId = partId;
        }

        public String getProjectId() {
            return ProjectId;
        }

        public void setProjectId(String projectId) {
            ProjectId = projectId;
        }




    }



}
