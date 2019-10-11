import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class PersonagemAdapter(val item: List<String> ): RecyclerView.Adapter<PersonagemAdapter.ViewHolder>(){
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(TextView((parent.context)))
    }

    override fun getItemCount(): Int {
        return item.size
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.textView.text = item[position]
    }


    class ViewHolder(val textView: TextView) : RecyclerView.ViewHolder(textView)
}