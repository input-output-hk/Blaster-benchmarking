import LiveScripts.Shared
import LiveScripts.S_92dbc081b63db36cde10188101bd489569a78cefe584dd948b9fcc05.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_92dbc081b63db36cde10188101bd489569a78cefe584dd948b9fcc05.script [datum, redeemer, ctx] 10000]
