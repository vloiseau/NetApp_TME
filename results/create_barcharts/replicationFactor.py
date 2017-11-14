import plotly.plotly as py
import plotly.graph_objs as go

x = ['Reads', 'Writes']
y1 = [91.02, 109.61]
y2 = [80.43, 183.94]

trace1 = go.Bar(
    x=x,
    y=y1,
    name = 'RF = 2',
    text=y1,
    textposition = 'auto',
    marker=dict(
        color='rgb(123,192,247)',
        line=dict(
            color='rgb(8,48,107)',
            width=1.5),
        ),
    opacity=0.8
)

trace2 = go.Bar(
    x=x,
    y=y2,
    name = 'RF = 3',
    text=y2,
    textposition = 'auto',
    marker=dict(
        color='rgb(241,130,38)',
        line=dict(
            color='rgb(8,48,107)',
            width=1.5),
        ),
    opacity=0.8
)


data = [trace1, trace2]

layout = go.Layout(
    title='Time to completion (min)',
    yaxis=dict(
        title='Time (min)',
        titlefont=dict(
            family='Courier New, monospace',
            size=16,
            color='rgb(107, 107, 107)'
        )
    )
)

fig = go.Figure(data=data, layout=layout)
py.plot(fig, filename='JBOD_Testing_Time')
