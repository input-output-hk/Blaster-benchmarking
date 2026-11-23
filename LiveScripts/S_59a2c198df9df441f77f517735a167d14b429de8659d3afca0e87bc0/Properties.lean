import LiveScripts.Shared
import LiveScripts.S_59a2c198df9df441f77f517735a167d14b429de8659d3afca0e87bc0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_59a2c198df9df441f77f517735a167d14b429de8659d3afca0e87bc0.script [ctx] 10000]
