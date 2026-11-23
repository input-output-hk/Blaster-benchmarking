import LiveScripts.Shared
import LiveScripts.S_505759098f5b622f9be627d45080eeda69c57db07fa5ca9e85329531.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_505759098f5b622f9be627d45080eeda69c57db07fa5ca9e85329531.script [ctx] 10000]
