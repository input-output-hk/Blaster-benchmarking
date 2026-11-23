import LiveScripts.Shared
import LiveScripts.S_13ccbeba1adf96f459763c7fc556bba331cf2930c198291464beb1d7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_13ccbeba1adf96f459763c7fc556bba331cf2930c198291464beb1d7.script [ctx] 10000]
