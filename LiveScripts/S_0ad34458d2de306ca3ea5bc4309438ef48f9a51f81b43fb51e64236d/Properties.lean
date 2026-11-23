import LiveScripts.Shared
import LiveScripts.S_0ad34458d2de306ca3ea5bc4309438ef48f9a51f81b43fb51e64236d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ad34458d2de306ca3ea5bc4309438ef48f9a51f81b43fb51e64236d.script [ctx] 10000]
