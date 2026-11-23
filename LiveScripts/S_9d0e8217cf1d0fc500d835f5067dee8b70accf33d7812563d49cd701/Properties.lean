import LiveScripts.Shared
import LiveScripts.S_9d0e8217cf1d0fc500d835f5067dee8b70accf33d7812563d49cd701.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9d0e8217cf1d0fc500d835f5067dee8b70accf33d7812563d49cd701.script [redeemer, ctx] 10000]
